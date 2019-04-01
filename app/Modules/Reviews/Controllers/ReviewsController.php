<?php

namespace App\Modules\Reviews\Controllers;

use App\User;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Modules\Forms\Models\Forms;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Modules\Reviews\Models\Reviews;
use Illuminate\Support\Facades\Session;
use App\Modules\Reviews\Models\ReviewList;
use App\Modules\Employees\Models\Employees;
use App\Modules\Forms\Models\GeneratedForms;
use App\Modules\Reviews\Models\ReviewResult;

class ReviewsController extends Controller
{
    protected $review;

    public function __construct(Reviews $review, ReviewList $reviewList, Employees $employees, Forms $form, User $user)
    {
        $this->review = $review;
        $this->reviewList = $reviewList;
        $this->employees = $employees;
        $this->form = $form;
        $this->user = $user;
    }

    public function selectCandidate(){
        $page = "select.candidate";
        $action = "create";
        $data = $this->employees->get();
        $forms = $this->form->get();
        $users = $this->user->get();
       
        return view('Reviews::select_candidate',compact('data','forms', 'users', 'page','action'));

    }

    /**
     * Show Review Form, Now only one format is supported: numeric rating system
     *
     * @return void
     */
    public function showForm(Request $request){

        $questions = GeneratedForms::join('questions as q', 'q.id', 'generated_forms.question_id')->where('form_id', $request->fid)->get();
        $employee_id = $request->eid;

        if($questions){           
            return view("Reviews::sample_review_form", compact('questions','employee_id'));
        }else{
            Session::flash('message', 'Review period is Off for this moment! return when your admin select you for review');
            return back();
        }

    }

    /**
     * Show The list of candidates to related reviewer
     *
     * @return void
     */
    public function showCandidates(){
        $builder = $this->reviewList
        ->select('*')
        ->join('employees as e', 'e.id', 'candidate_list.employee_id')->where('candidate_list.status','open');

        if(Auth::user()->hasRole('admin')){
            $candidates =   $builder->get();
        }else if(Auth::user()->hasRole('hr')){
            $candidates = $builder  
            ->where('reviewer_id', Auth::user()->id)->get();
        }else if(Auth::user()->hasRole('employee')){
            $candidates = $builder  
            ->where('employee_id', Employees::getId())->get();
        }
        

        if($candidates){
           
            return view("Reviews::list_candidates", compact('candidates'));
        }else{
            Session::flash('message', 'Review period is Off for this moment! return when your admin select you for review');
            return back();
        }

    }
    /**
     * Create Template form for review
     * temp_id, json_data, request->schema
     *
     * @param Request $request
     * @return void
     */
    public function createTemplate(Request $request)
    {
        $this->template->create($request->all());
    }

    /**
     * Store result of employee after done review by reviewer
     */

    public function saveReviewResult(Request $request){
        $data = $request->except('_token','submit','employee_id');
       
        $id = $request->employee_id;

        $result = [];
        foreach($data as $key=>$value){
    
            $result[] = ['employee_id'=>$id, 'field_name'=>$key, 'point'=>$value];
        }
       
        ReviewResult::insert($result);
        $list = ReviewList::where('employee_id', $id)->first();
        
        $list->update(['status'=>'completed']);
        Session::flash('message', "Thank you for review");
        return redirect(route('review.show.candidates'));

    }

   


    /**
     * Store the list of selected candidates with there reviewer id
     *
     * @param Request $request
     * @return void
     */
    public function storeCandidate(Request $request){
        
        $employees = $request->employee_id;
        $reviewer = $request->reviewer_id;
        $fid = $request->form_id;
        $data = [];

        $i=0;
        foreach($employees as $id){
            $data[] = ['employee_id'=> $id, 'form_name'=>'sample_review_form', 'form_id'=>$fid, 'reviewer_id'=>$reviewer[$i], 'status'=>'open'];
            $i++;
        }
   //dd($data);
        if($this->reviewList->insert($data)){
            Session::flash('message', "success");
        }else{
            Session::flash('message', "Failed");
        }
      
        
        return redirect(route('review.candidates'));
    }

    public function getCandidates(){
        $page = "candidates";
        $data = DB::table('candidate_list as r')->select('e.id', 'e.first_name', 'e.last_name')->join('employees as e', 'e.id', '=', 'r.employee_id')->get();
        return view('Reviews::candidates', compact('data', 'page'));
    }

    /**
     * Show Result page
     *
     * @param Request $request
     * @return void
     */
    public function showResult(Request $request){
        $page = 'result';
       
        if(Auth::user()->hasRole('employee')){
            $id = Employees::getIdByEmail(Auth::user()->email);
            $data = DB::select(DB::raw('SELECT employee_id, sum(point) as points, first_name, last_name FROM ems_db.review_result join employees as e on employee_id=e.id where employee_id='.$id.' group by employee_id, first_name, last_name'));
        }else{
            $data = DB::select(DB::raw('SELECT employee_id, sum(point) as points, first_name, last_name FROM ems_db.review_result join employees as e on employee_id=e.id group by employee_id, first_name, last_name'));

        }
        return view('Reviews::result', compact('data', 'page', 'action'));
        
    }
}
