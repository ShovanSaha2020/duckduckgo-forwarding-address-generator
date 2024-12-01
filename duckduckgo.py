def get_email_addresses():
    from_email = input("Please enter the 'from' email address: ")
    to_email = input("Please enter the 'to' email address: ")
    return from_email, to_email

def format_email(to_email):
    to_email = to_email.replace('@', '_at_')
    return to_email

def concatenate_emails(from_email, to_email):
    return to_email+ '_' + from_email 

def main():
    from_email, to_email = get_email_addresses()
    to_email = format_email(to_email)
    email = concatenate_emails(from_email, to_email)

    print(f"Email: {email}")

while True:
    main()
    repeat = input("Do you want to use the program again? (yes/no): ")
    if repeat.lower() != "yes":
        break

