#! /bin/bash
# Note for documentation, see send-registration.sh.
# Configuration
Name='Arjan'
Surname='Oortgiese'
Email='a.oortgiese@student.ru.nl'
RegistrationType='Early Student'
Amount='225'

# Remember:
#           | Student | Regular
# ----------+---------+--------
# Early     | 225 EUR | 300 EUR
# Late      | 275 EUR | 350 EUR

# Generate message
Message="confirmation-$Email.txt"
echo -n "" > $Message
echo "Dear $Name $Surname," >> $Message
echo "" >> $Message
echo "We hereby confirm the payment of your registration fee for the 28th Symposium on the Implementation and Application of Functional Languages (IFL 2016).
" >> $Message
echo "Details:" >> $Message
echo "Amount: $Amount EUR" >> $Message
echo "Registration Type: $RegistrationType" >> $Message
echo "Name: $Name $Surname" >> $Message
echo "" >> $Message
echo "Contact the organizing committee <ifl2016@cs.kuleuven.be> with any questions or concerns." >> $Message
echo "" >> $Message
echo "Best regards," >> $Message
echo "" >> $Message
echo "The IFL 2016 Organizing Committee" >> $Message

# Send mail
mail -a From:ifl2016@cs.kuleuven.be -s "IFL 2016 Payment Confirmation" -c "" -b "ifl2016@cs.kuleuven.be" $Email < $Message
