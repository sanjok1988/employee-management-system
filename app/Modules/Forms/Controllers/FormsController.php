<?php

namespace App\Modules\Forms\Controllers;

use Illuminate\Http\Request;
use App\Modules\Forms\Models\Forms;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\Modules\Questions\Models\Questions;
use App\Modules\Forms\Models\GeneratedForms;

class FormsController extends Controller
{
    public function __construct(Questions $questions, GeneratedForms $genForm, Forms $form)
    {
        $this->questions = $questions;
        $this->genForm = $genForm;
        $this->form = $form;
    }

    public function index()
    {
        $page = "form";
        $data = $this->form->paginate(10);
        return view('Forms::index',compact('data','page'));
    }

    /**
     * Create and edit from same form
     *
     * @param Request $request
     * @return void
     */
    public function create(Request $request)
    {
        $form = '';
        $ques = [];
        $page = "form";
        if($request->has('id')){
            $action = "edit";
            $form = $this->form->find($request->id);
            $questions = $this->genForm->select('question_id')->where('form_id', $request->id)->get();
            if(count($questions)>0){
                foreach($questions as $v){
                    $ques[] = $v->question_id;
                }
            }
            
        }else{
            $action = 'create';
            
        }
        $data = $this->questions->orderBy('id','DESC')->paginate(10);
        
       
        return view("Forms::create", compact('form','ques','data','page', 'action'));
    }

    /**
     * Store and Update
     *
     * @param Request $request
     * @return void
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),
        [
            'name' => 'required',
            'start_date'=>'required',
            'end_date'=>'required'
            
        ]);
        if($validator->fails()){
            return back()->withErrors($validator)->withInput();
        }
        //$name = Forms::getNameById($request->form_id);
        $form = $this->form->create($request->only('name','description','start_date', 'end_date'));
        $questions = $request->only('question_id');
        $q = [];
        foreach($questions['question_id'] as $key=>$value){
            
            $q[] = ['question_id'=>$value, 'form_id'=>$form->id];
        }
     
        $this->genForm->insert($q);
        return redirect(route('form.index'));
    }
}
