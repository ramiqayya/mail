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


            // ... do something else with emails ...

            for (email of emails) {
                console.log(email)
                const em = document.createElement('div') //email tag container div
                const senderdiv = document.createElement('div')//sender test div
                const subjdiv = document.createElement('div')//subject div
                const timediv = document.createElement('div')//timestamp div
                em.classList.add("email-tag");
                em.dataset.eId = email.id
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

                if (email.read === true) {
                    em.style.backgroundColor = '#e5e5e5'
                }




                document.querySelectorAll(".email-tag").forEach(function (emailclick) {
                    emailclick.onclick = function () {
                        fetch(`/emails/${emailclick.dataset.eId}`)
                            .then(response => response.json())
                            .then(emaildetails => {

                                // console.log(emailclick)
                                // mark email as read
                                fetch(`/emails/${emailclick.dataset.eId}`, {
                                    method: 'PUT',
                                    body: JSON.stringify({
                                        read: true
                                    })
                                })
                                console.log(mailbox)
                                console.log(emaildetails.archived)



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
                                fromtage.innerHTML = `<b>From:</b> ${emaildetails.sender}`;
                                totage.innerHTML = `<strong>To:</strong> ${emaildetails.recipients}`;
                                subjectage.innerHTML = `<strong>Subject:</strong> ${emaildetails.subject}`;
                                timetage.innerHTML = `<strong>Timestamp:</strong> ${emaildetails.timestamp}`;
                                replybutton.innerHTML = `Reply`;
                                replybutton.id = 'replyid'
                                emailbody.innerText = emaildetails.body
                                emailb.append(fromtage)
                                emailb.append(totage)
                                emailb.append(subjectage)
                                emailb.append(timetage)
                                emailb.append(replybutton)
                                emailb.append(justanhr)
                                emailb.append(emailbody)

                                if (mailbox === 'inbox' && emaildetails.archived === false) {
                                    const archiveb = document.createElement('button');
                                    archiveb.innerHTML = 'Archive';
                                    archiveb.id = 'archive';


                                    emailb.append(archiveb);



                                } else if (mailbox === 'archive' && emaildetails.archived == true) {

                                    const unarchiveb = document.createElement('button');
                                    unarchiveb.id = 'unarchive';
                                    unarchiveb.innerHTML = 'Unarchive';

                                    emailb.append(unarchiveb);


                                }

                                const archive = document.getElementById('archive')
                                if (archive != null) {
                                    archive.disabled = false;

                                    archive.addEventListener('click', () => {
                                        fetch(`/emails/${emailclick.dataset.eId}`, {
                                            method: 'PUT',
                                            body: JSON.stringify({
                                                archived: true
                                            })
                                        })
                                        archive.disabled = true;

                                    })

                                }
                                const unarchive = document.getElementById('unarchive')
                                if (unarchive != null) {
                                    unarchive.disabled = false;
                                    unarchive.onclick = () => {
                                        fetch(`/emails/${emailclick.dataset.eId}`, {
                                            method: 'PUT',
                                            body: JSON.stringify({
                                                archived: false
                                            })
                                        })
                                        unarchive.disabled = true;

                                    }

                                }




                                // ... do something else with email ...

                            });

                    }
                })

            }
        })
    // }
    // )









}


