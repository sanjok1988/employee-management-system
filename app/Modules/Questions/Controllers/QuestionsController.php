<?php

namespace App\Modules\Questions\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modules\Questions\Models\Questions;
use Session;
class QuestionsController extends Controller
{

    private $page = "form";
    public function __construct(Questions $questions){
        $this->questions = $questions;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function questionList()
    {
        $page = "questionnaire";
        $data = $this->questions->paginate(10);
        return view("Questions::index", compact('page','data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createQuestionnaire()
    {
        $page = "questionnaire";
        $action = "create";
        return view('Questions::create_questionnaire', compact('page','action'));
    }

    /**
     * Store a newly created questionnaire in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeQuestionnaire(Request $request)
    {
        $data = $request->only('question','ques_type');
        if($request->has('id')){
            $find = $this->questions->find($request->id);
            $find->update($data);
            return redirect(route('questionnaire.index'));
        }else{
            $this->questions->create($data);
        }
        
        return redirect(route('questionnaire.create'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editQuestionnaire($id)
    {
        $page = "questionnaire";
        $action = "edit";
        $data = $this->questions->find($id);
        return view('Questions::create_questionnaire', compact('page','action','data'));
    }

    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyQuestionnaire($id)
    {
        if($q = $this->questions->find($id)){
            $q->delete();
            Session::flash('message', "successfully deleted");
        }else{
            Session::flash('message', "Failed");
        }
        return redirect()->intended();
    }
}
