Rails.application.routes.draw do
  root to: "students#intro"

  get "students/intro", to: "students#intro"
  resources :students do
    resources :courses do
      post '/enroll', to: "courses#enroll"
      resources :assignments
    end
    resources :enrolled_student_assignments, only: [:show, :index]
    get 'enrolled_student_assignments/submit_submission/:id', to: "enrolled_student_assignments#submit_submission"
    patch 'enrolled_student_assignments/:enrolled_student_assignment_id/create_submission', to: "enrolled_student_assignments#create_submission"
  end
end
