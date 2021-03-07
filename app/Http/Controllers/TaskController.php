<?php

namespace App\Http\Controllers;

use App\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    protected $task;

    public function __construct(Task $task)
    {
        $this->task = $task;
    }

    public function getTask() {
        $data = $this->task->orderBy('position')->get();
        return response()->json( $data, $status = 200);
    }

    public function saveTaskOrder(Request $request){
        if($request->ajax()){
          $order = $request->all();
    
          foreach ($order as $key=>$value) {
              $this->task->where('id', $value)->update(['position' => $key]);
    
          }
    
          return response()->json([
              'error' => 0,
              'msg' => 'Successfull',
          ]);
        }else{
          return response()->json(['msg'=>'middleman attract']);
        }
    
      }
}
