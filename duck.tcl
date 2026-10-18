#!/usr/bin/env wish

wm title . "DuckDuckGo Email Formatter"
font create bigFont -family Helvetica -size 20

label .lbl_from -text "Enter your personal Duck Address:" -font bigFont -anchor center
entry .ent_from -font bigFont -width 30 -justify center
pack .lbl_from .ent_from -padx 10 -pady 10
label .lbl_to -text "Enter the recipient's email address:" -font bigFont -anchor center
entry .ent_to -font bigFont -width 30 -justify center
pack .lbl_to .ent_to -padx 10 -pady 10
label .lbl_result -text "Generated address:" -font bigFont -anchor center
text .txt_result -font bigFont -width 40 -height 2 -wrap word -state disabled
pack .lbl_result .txt_result -padx 10 -pady 10
.txt_result tag configure center -justify center

proc process_emails {} {
    set from_email [string trim [.ent_from get]]
    set to_email [string trim [.ent_to get]]

    if {![regexp {^[^@\s]+@duck\.com$} $from_email]} {
        tk_messageBox -icon error -type ok -title "Invalid Duck Address" \
            -message "Enter your personal Duck Address, such as jane@duck.com."
        return
    }
    if {![regexp {^[^@\s]+@[^@\s]+$} $to_email]} {
        tk_messageBox -icon error -type ok -title "Invalid Recipient Address" \
            -message "Enter a valid recipient email address."
        return
    }

    set to_email [string map {@ _at_} $to_email]
    set from_username [string range $from_email 0 [expr {[string first @ $from_email] - 1}]]
    set email [format "%s_%s@duck.com" $to_email $from_username]

    .txt_result configure -state normal
    .txt_result delete 1.0 end
    .txt_result insert end $email center
    .txt_result configure -state disabled
}
proc reset_form {} {
    .ent_from delete 0 end
    .ent_to delete 0 end
    .txt_result configure -state normal
    .txt_result delete 1.0 end
    .txt_result configure -state disabled
}
button .btn_submit -text "Generate" -command process_emails -font bigFont -width 10
button .btn_reset -text "Reset" -command reset_form -font bigFont -width 10
button .btn_quit -text "Quit" -command exit -font bigFont -width 10
pack .btn_submit .btn_reset .btn_quit -padx 10 -pady 10


