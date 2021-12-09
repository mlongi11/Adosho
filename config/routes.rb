Rails.application.routes.draw do

  # Routes for page navigation
  get("/", {:controller => "application", :action => "landing_page"})

  get("/pets", {:controller => "pets", :action => "index"})

  # Routes for the Application resource:

  # CREATE
  post("/create_application/:pet_id", { :controller => "applications", :action => "create" })
          
  # READ
  get("/applications", { :controller => "applications", :action => "index" })
  
  get("/applications/:path_id", { :controller => "applications", :action => "show" })
  
  # UPDATE
  
  post("/modify_application/:path_id", { :controller => "applications", :action => "update" })
  
  # DELETE
  get("/delete_application/:path_id", { :controller => "applications", :action => "destroy" })

  #------------------------------

  # Routes for the Match resource:

  # CREATE
  post("/insert_match", { :controller => "matches", :action => "create" })
          
  # REFRESH
  get("/refresh_matches", { :controller => "matches", :action => "refresh_matches" })

  # READ
  get("/matches", { :controller => "matches", :action => "index" })
  
  get("/matches/:path_id", { :controller => "matches", :action => "show" })
  
  # UPDATE
  
  post("/modify_match/:path_id", { :controller => "matches", :action => "update" })
  
  # DELETE
  get("/delete_match/:path_id", { :controller => "matches", :action => "destroy" })

  #------------------------------

  # Routes for the Pet breed resource:

  # CREATE
  post("/insert_pet_breed", { :controller => "pet_breeds", :action => "create" })
          
  # READ
  get("/pet_breeds", { :controller => "pet_breeds", :action => "index" })
  
  get("/pet_breeds/:path_id", { :controller => "pet_breeds", :action => "show" })
  
  # UPDATE
  
  post("/modify_pet_breed/:path_id", { :controller => "pet_breeds", :action => "update" })
  
  # DELETE
  get("/delete_pet_breed/:path_id", { :controller => "pet_breeds", :action => "destroy" })

  #------------------------------

  # Routes for the Breed web resource:

  # CREATE
  post("/insert_breed_web", { :controller => "breed_webs", :action => "create" })
          
  # READ
  get("/breed_webs", { :controller => "breed_webs", :action => "index" })
  
  get("/breed_webs/:path_id", { :controller => "breed_webs", :action => "show" })
  
  # UPDATE
  
  post("/modify_breed_web/:path_id", { :controller => "breed_webs", :action => "update" })
  
  # DELETE
  get("/delete_breed_web/:path_id", { :controller => "breed_webs", :action => "destroy" })

  #------------------------------

  # Routes for the Watchlist resource:

  # CREATE
  get("/insert_watchlist/:pet_id", { :controller => "watchlists", :action => "create" })
          
  # READ
  get("/watchlists", { :controller => "watchlists", :action => "index" })
  
  get("/watchlists/:path_id", { :controller => "watchlists", :action => "show" })
  
  # UPDATE
  
  post("/modify_watchlist/:path_id", { :controller => "watchlists", :action => "update" })
  
  # DELETE
  get("/delete_watchlist/:pet_id", { :controller => "watchlists", :action => "destroy" })

  #------------------------------

  # Routes for the Interest resource:

  # CREATE
  post("/insert_interest", { :controller => "interests", :action => "create" })
          
  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  
  get("/interests/update", { :controller => "interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_interest/:path_id", { :controller => "interests", :action => "update" })
  
  # DELETE
  get("/delete_interest/:path_id", { :controller => "interests", :action => "destroy" })

  #------------------------------

  # Routes for the List of breed resource:

  # CREATE
  post("/insert_list_of_breed", { :controller => "list_of_breeds", :action => "create" })
          
  # READ
  get("/list_of_breeds", { :controller => "list_of_breeds", :action => "index" })
  
  get("/list_of_breeds/:path_id", { :controller => "list_of_breeds", :action => "show" })
  
  # UPDATE
  
  post("/modify_list_of_breed/:path_id", { :controller => "list_of_breeds", :action => "update" })
  
  # DELETE
  get("/delete_list_of_breed/:path_id", { :controller => "list_of_breeds", :action => "destroy" })

  #------------------------------

  # Routes for the Breed preference resource:

  # CREATE
  post("/insert_breed_preference", { :controller => "breed_preferences", :action => "create" })
          
  # READ
  get("/breed_preferences", { :controller => "breed_preferences", :action => "index" })
  
  get("/breed_preferences/:path_id", { :controller => "breed_preferences", :action => "show" })
  
  # UPDATE
  
  post("/modify_breed_preference/:path_id", { :controller => "breed_preferences", :action => "update" })
  
  # DELETE
  get("/delete_breed_preference/:path_id", { :controller => "breed_preferences", :action => "destroy" })

  #------------------------------

  # Routes for the Pet resource:

  # CREATE
  post("/insert_pet", { :controller => "pets", :action => "create" })
          
  # READ
  get("/pets", { :controller => "pets", :action => "index" })
  
  get("/pets/:path_id", { :controller => "pets", :action => "show" })
  
  # UPDATE
  
  post("/modify_pet/:path_id", { :controller => "pets", :action => "update" })
  
  # DELETE
  get("/delete_pet/:path_id", { :controller => "pets", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
