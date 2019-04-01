@extends('Layouts::master')
@section('content')
<style>
    .table td{
        text-align: center;
    }
    </style>
    <?php
    $data = [
        "qid_0"=>"Understands job requirements and responsibilities",
        "qid_1"=>"Possesses required skills and knowledge for the job",
        "qid_2"=>"Keeps abreast of current developments pertaining to the job"
        ];

        $data1 = [
        "qid_3"=>"Works in an organized manner",
        "qid_4"=>"Requires minimal supervision	",
        "qid_5"=>"Can identify problems",
        "qid_6"=>"Reacts to problems in appropriate time"
        ];

?>
<div class="box-header">
 
   
                        <div class="box-body">
                            <h2>Employee Performance Evaluation</h2>
                            <p>Please fill it out. It's awesome!</p>
                            <p>Please rate the employee (candidate) using the following performance rating scale: </p>
                                <li>1 - Poor: employee (candidate) does not meet minimum job requirements </li>
                                <li>2 - Average: employee (candidate) meets some job requirements </li>
                                <li>3 - Good: employee (candidate) meets all job requirements </li>
                                <li>4 - Excellent: employee (candidate) meets and often exceeds job requirements </li>
                                <li>5 - Outstanding: employee (candidate) exceeds job requirements</li>

                                <hr>
                                <h4>Section I : Job Knowledge</h4>
                            <form   method="post" class="" action="{{ route('review.store') }}" enctype='multipart/form-data' >
                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                
                                <input type="hidden" name="employee_id" value="{{ request()->eid }}">
                                <input type="hidden" name="form_id" value="{{ request()->fid }}">
                                

                                    <h4>Section II: Planning and Problem Solving
                                        </h4>
                                    <table class="table table-bordered table-hover " >
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th>Poor</th>
                                                <th>Average</th>
                                                <th>Good</th>
                                                <th>Excellent</th>
                                                <th>Outstanding</th>
                                                <th>N/A</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($questions as $key=>$value)
                                              <tr>
                                                <td style="text-align:left">{{ $value->question }}</td>
                                                
                                                @for($i=0; $i<=5; $i++)
                                                <td><input type="radio" name="{{'qid_'.$value->question_id}}" value="{{$i}}" {{($i==0)?"checked":''}}></td>
                                                @endfor
                                                
                                              </tr>    
                                                 @endforeach
                                            </tbody>
                                        </table>
                                        <input type="submit" name="submit" value="Submit" class="btn btn-success pull-right">
                            </form>
                        </div>
                       
                    </div>
                </div>

                <!-- end col -->

    
@endsection
<script>
    $(document).ready(function() {
        $('#example').DataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false
    } );
    });
</script>