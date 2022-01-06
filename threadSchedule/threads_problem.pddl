(define (problem threads)
   (:domain threads)
   (:objects thread1 - thread thread2 - thread thread3 - thread 
        task1 - task task2 - task task3 - task task4 - task
         task5 - task task6 - task task7 - task task8 - task
   )
   (:init 
   
    (= (task_duration task1) 10) 
    (= (task_duration task2) 5) 
    (= (task_duration task3) 20) 
    (= (task_duration task4) 15)
    (= (task_duration task5) 10) 
    (= (task_duration task6) 5) 
    (= (task_duration task7) 20) 
    (= (task_duration task8) 15)
    (= (task_priority task1) 1) 
    (= (task_priority task2) 2)
    (= (task_priority task3) 1)
    (= (task_priority task4) 3)
    (= (task_priority task5) 1) 
    (= (task_priority task6) 2)
    (= (task_priority task7) 1)
    (= (task_priority task8) 3)

   )
   (:goal (and 
        (task_done task1)
        (task_done task2)
        (task_done task3)
        (task_done task4)   
        (task_done task5)
        (task_done task6)
        (task_done task7)
        (task_done task8) 
   )
   )
)