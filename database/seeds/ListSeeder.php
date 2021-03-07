<?php

use Illuminate\Database\Seeder;

class ListSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $list = [];
        for($i=1; $i<=10; $i++){
            array_push($list, ['name'=>'Task-'.$i, 'position'=>$i]);
        }
        

        DB::table('tasks')->insert($list);

    }
}
