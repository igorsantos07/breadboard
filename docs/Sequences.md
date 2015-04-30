Sequential "diagram"
====================

I know this is not a diagram but it documents stuff in a simplified manner as the original diagram should, so...
This describes the flux between interface elements and methods from the application code.

***Note**: it is assumed that all dialogs and modals are closed upon submission or cancellation.* 

## Projects

### Create a new project
1. User clicks link/button
2. `Bootstrap` opens modal
3. `Bootstrap` modal event is called to focus on field 
4. The user may:
    1. *Save new data*:
        1. User fills in form and submits
        2. `ProjectController.create` creates and stores the new record
    2. *Give up*:
        1. User cancels modal
5. `Bootstrap` modal event is called to clean up possible modal validation messages

### Edit a project
1. User locates the project and hits the edit button
2. `ProjectView.edit` toggles form in place of project name
3.  The user may:
    1. *Save new data*:
        1. User make changes and submit
        2. `ProjectView.save` saves changes and toggles project name back
    2. *Give up*:
        1. User cancels editing form
        2. `ProjectView.edit` toggles project name back

### Remove a project
1. User locates the project and hits the remove button
2. `ProjectView.remove` show confirm dialog
    1. The user may:
        1. *Confirm*: Project is deleted
        2. *Cancel*: nothing happens
  
### Add a board
1. User locates project
2. User clicks link/button for new board
3. `ProjectView.newBoard` toggles new board form
4. The user may:
    1. *Save new data*: 
        1. User fills in the form and submits
        2. `ProjectView.createBoard` creates and stores the new record, and toggles the form back
    2. *Cancel*:
        1. User cancels form
        2. `ProjectView.newBoard` toggles form back
        
### Edit a board

### Remove a board
