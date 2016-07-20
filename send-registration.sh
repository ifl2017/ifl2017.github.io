#! /bin/bash

# Configuration
# Change these variables to their appropriate values before running the script.
Name=''
Surname=''
Email=''
RegistrationType=''
# Registration type is Early/Late Student/Regular.


# Generate message
# The message is stored in a file called registration-$Email.txt.
# The message is then appended to the file by the subsequent echo statements.
# After the script has completed, the message file remains to serve as a record
# of the transmission.
Message="registration-$Email.txt"
echo -n "" > $Message
echo "Dear $Name $Surname," >> $Message
echo "" >> $Message
echo "Thank you for registering for the 28th Symposium on the Implementation and Application of Functional Languages (IFL 2016) to be held in Leuven, Belgium on August 31 - September 2, 2016." >> $Message
echo "" >> $Message
echo "Details:" >> $Message
echo "Registration Type: $RegistrationType" >> $Message
echo "Name: $Name $Surname" >> $Message
echo "" >> $Message
echo "A list of suggested hotels can be found here: https://goo.gl/h5FRtH" >> $Message
echo "If you want to share with the other participants where you are staying, you can add your hotel and name in the document." >> $Message
echo "" >> $Message
echo "Contact the organizing committee <ifl2016@cs.kuleuven.be> with any questions or concerns." >> $Message
echo "" >> $Message
echo "Best regards," >> $Message
echo "" >> $Message
echo "The IFL 2016 Organizing Committee" >> $Message

# Send mail
# Uses the mail command (see the man page):
# Note the use of -b (blind carbon copy) to send a copy of this email to the
# ifl2016 address. The message is sent to $Email, while the message itself
# is contained in the file identified by $Message.
mail -a From:ifl2016@cs.kuleuven.be -s "IFL 2016 Registration" -c "" -b "ifl2016@cs.kuleuven.be" $Email < $Message
