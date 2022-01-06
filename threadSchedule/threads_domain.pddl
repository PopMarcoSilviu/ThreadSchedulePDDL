(define (domain threads)
    (:requirements :negative-preconditions :durative-actions :duration-inequalities 
        :fluents :disjunctive-preconditions :typing :continuous-effects :universal-preconditions)   
    (:types
        thread
        task
    )
    (:predicates
    (is_working ?t)
    (task_processing ?r)
    (thread_busy_with_task ?t ?r)
    (task_done ?r)
    (task_finished_processing ?r)
    )
   
   (:functions
       (task_duration ?t - thread)
       (task_priority ?r - task)
   )

   (:durative-action schedule_task
       
       :parameters (?t - thread ?r - task)
       :duration (= ?duration 2)
       :condition (and 
           (at start (and 
                (not (is_working ?t))
                (not (task_done ?r))
                (not (task_processing ?r))
                (not (thread_busy_with_task ?t ?r)) 
                (forall (?x - task) 
                    (or (>= (task_priority ?x) (task_priority ?r)) 
                        (task_done ?x)
                        (task_processing ?x)
                )     
        )))
       )
       :effect (and 
           (at start (and
                    (thread_busy_with_task ?t ?r)
                    (task_processing ?r)
           ))
       )
   )
   



    (:durative-action process_task
        :parameters (?t  - thread ?r - task)
        :duration (= ?duration(task_duration ?r ))
        :condition (and 
            (at start (and 
                (thread_busy_with_task ?t ?r)
                (task_processing ?r)
            ))
        )
        :effect (and 
            (at start (and 
                  
                  (is_working ?t)
            ))
            (at end (and 
                (not (is_working ?t))
                (task_finished_processing ?r)
            ))
        )
    )

    (:durative-action finish_task
        :parameters ( ?t ?r) 
        :duration (= ?duration 1)
        :condition (and 
            (at start (and 
                (task_finished_processing ?r)
                (thread_busy_with_task ?t ?r)
            ))
           
        )
        :effect (and 
            (at start (and 
                (not (is_working ?t))
                (not (thread_busy_with_task ?t ?r))
                
            ))
            (at end (and 
                (not (task_processing ?r))
                (task_done ?r)
            ))
        )
    )
    
    
)

    


