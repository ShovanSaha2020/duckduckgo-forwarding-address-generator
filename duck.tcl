#!/usr/bin/env wish

# Set window title
wm title . "Email Formatter"

# Define a big font
font create bigFont -family Helvetica -size 20

# Label and entry for 'from' email
label .lbl_from -text "Enter the 'from' email address:" -font bigFont
entry .ent_from -font bigFont -width 30
pack .lbl_from .ent_from -padx 10 -pady 10

# Label and entry for 'to' email
label .lbl_to -text "Enter the 'to' email address:" -font bigFont
entry .ent_to -font bigFont -width 30
pack .lbl_to .ent_to -padx 10 -pady 10

# Text box for output (user can copy from here)
label .lbl_result -text "Result:" -font bigFont
text .txt_result -font bigFont -width 40 -height 2
.txt_result configure -state disabled
pack .lbl_result .txt_result -padx 10 -pady 10

# Function to process emails
proc process_emails {} {
    set from_email [.ent_from get]
    set to_email [.ent_to get]

    # Replace '@' with '_at_'
    set to_email [string map {@ _at_} $to_email]

    # Concatenate
    set email "${to_email}_${from_email}"

    # Update result text box
    .txt_result configure -state normal
    .txt_result delete 1.0 end
    .txt_result insert end $email
    .txt_result configure -state disabled
}

# Function to reset entries and result
proc reset_form {} {
    .ent_from delete 0 end
    .ent_to delete 0 end
    .txt_result configure -state normal
    .txt_result delete 1.0 end
    .txt_result configure -state disabled
}

# Buttons
button .btn_submit -text "Submit" -command process_emails -font bigFont
button .btn_reset -text "Reset" -command reset_form -font bigFont
button .btn_quit -text "Quit" -command exit -font bigFont
pack .btn_submit .btn_reset .btn_quit -padx 10 -pady 10

