<template>

    <div v-drag-and-drop:options="options">
       
                        <ul class="list-group">
                           
                            
                               
                                    <li class="list-group-item" v-for="task in tasks" :key="task.id" v-text="task.name">
                                        {{task.name}}</li>
                               
         
                            
                        </ul>
                                
                      
    </div>
  
</template>

<script>
  import draggable from 'vuedraggable'
import VueDraggable from 'vue-draggable'

    export default {
        name: 'Tasks',
        components: {
            draggable
            

        },
        data(){
            return {
                tasks:[],
                task: {
                    id:'',
                    name:'',
                    position:''
                }
            }
        },
        created() {
            this.fetchTaskList();
        },
        ready() {
            console.log('Component ready.')
        },
        methods: {
            fetchTaskList() {
                fetch('api/task')
                .then(response=> response.json())
                .then(response => {
                    console.log(response)
                    this.tasks = response;
                })
            }
        }
    }
</script>
