Feature: User

    Scenario: new_user
        Given starting with no users
        And a new user
        Then I can check the user
    Scenario: registered_user_check_if_app_contains_animes
        Given starting with no users
        And a new user
        Then I can check the user
        Then get all anime
    Scenario: registered_user_check_if_app_contains_animes_evidenza
        Given starting with no users
        And a new user
        Then I can check the user
        Then get all anime 'evidenza'
    Scenario: registered_user_check_if_app_contains_animes_suggeriti
        Given starting with no users
        And a new user
        Then I can check the user
        Then get all anime 'suggeriti'
    Scenario: registered_user_check_if_app_contains_animes_with_name
        Given starting with no users
        And a new user
        Then I can check the user
        Then get all anime with name = One
    

 