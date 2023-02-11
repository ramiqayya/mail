document.addEventListener('DOMContentLoaded', function () {

    // Use buttons to toggle between views
    document.querySelector('#inbox').addEventListener('click', () => load_mailbox('inbox'));
    document.querySelector('#sent').addEventListener('click', () => load_mailbox('sent'));
    document.querySelector('#archived').addEventListener('click', () => load_mailbox('archive'));
    document.querySelector('#compose').addEventListener('click', compose_email);


    // console.log("takeha")
    document.querySelector('form').addEventListener("submit", function (event) {
        event.preventDefault();
    })
    document.querySelector('form').onsubmit = () => {
        const reci = document.querySelector('#compose-recipients').value;
        const subj = document.querySelector('#compose-subject').value;
        const bod = document.querySelector('#compose-body').value;
        fetch('/emails', {
            method: 'POST',
            body: JSON.stringify({
                recipients: reci,
                subject: subj,
                body: bod
            })
        })
            .then(response => response.json())
            .then(result => {
                // Print result
                console.log(result);
            });

        load_mailbox('sent')

    }





    // By default, load the inbox
    load_mailbox('inbox');


});

function compose_email() {
    // let's try this one 



    // Show compose view and hide other views
    document.querySelector('#emails-view').style.display = 'none';
    document.querySelector('#compose-view').style.display = 'block';

    // Clear out composition fields
    document.querySelector('#compose-recipients').value = '';
    document.querySelector('#compose-subject').value = '';
    document.querySelector('#compose-body').value = '';
}

function load_mailbox(mailbox) {
    // Show the mailbox and hide other views
    document.querySelector('#emails-view').style.display = 'block';
    document.querySelector('#compose-view').style.display = 'none';
    //added this to hide email body
    document.querySelector('#emailb').style.display = 'none'

    // Show the mailbox name
    document.querySelector('#emails-view').innerHTML = `<h3>${mailbox.charAt(0).toUpperCase() + mailbox.slice(1)}</h3>`;

    //show emails

    fetch(`/emails/${mailbox}`)
        .then(response => response.json())
        .then(emails => {
            // Print emails
            console.log(emails);

            // ... do something else with emails ...

            for (email of emails) {
                const em = document.createElement('div')
                const senderdiv = document.createElement('div')
                const subjdiv = document.createElement('div')
                const timediv = document.createElement('div')
                em.id = "email-tag"
                senderdiv.id = "sender"
                subjdiv.id = "subject"
                timediv.id = "time"
                senderdiv.innerHTML = email.sender
                subjdiv.innerHTML = email.subject
                timediv.innerHTML = email.timestamp
                em.append(senderdiv)
                em.append(subjdiv)
                em.append(timediv)
                body = document.querySelector('#emails-view')
                body.append(em)
                em.onclick = () => {
                    fetch(`/emails/${email.id}`)
                        .then(response => response.json())
                        .then(email => {
                            // Print email
                            console.log(email);
                            document.querySelector('#emails-view').style.display = 'none';
                            document.querySelector('#compose-view').style.display = 'none';
                            document.querySelector('#emailb').style.display = 'block';

                            const emailb = document.querySelector('#emailb');
                            //this loop to clear the old emails viewed
                            while (emailb.firstChild) {
                                emailb.removeChild(emailb.firstChild);
                            }


                            const fromtage = document.createElement('p');
                            const totage = document.createElement('p');
                            const subjectage = document.createElement('p');
                            const timetage = document.createElement('p');
                            const replybutton = document.createElement('button');
                            const justanhr = document.createElement('hr');
                            const emailbody = document.createElement('p');
                            fromtage.innerHTML = `<b>From:</b> ${email.sender}`;
                            totage.innerHTML = `<strong>To:</strong> ${email.recipients}`;
                            subjectage.innerHTML = `<strong>Subject:</strong> ${email.subject}`;
                            timetage.innerHTML = `<strong>Timestamp:</strong> ${email.timestamp}`;
                            replybutton.innerHTML = `Reply`;
                            replybutton.id = 'replyid'
                            emailbody.innerText = email.body
                            emailb.append(fromtage)
                            emailb.append(totage)
                            emailb.append(subjectage)
                            emailb.append(timetage)
                            emailb.append(replybutton)
                            emailb.append(justanhr)
                            emailb.append(emailbody)




                            // ... do something else with email ...

                        });



                }

            }
        });







}


