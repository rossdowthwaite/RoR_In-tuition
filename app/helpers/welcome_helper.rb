module WelcomeHelper

    def course_welcome
       @welcome = 
             '<center>
               <h2>This is your Courses page!</h2>
               <p>This is where all your courses live</p><br>
               <h3>You don\'t have any courses yet</h3>
               <p>Whether your a student or a tutor you can access your course data here.</p>
               <h3>Tutor?</h3>
               <p>Get started by adding your own course and start enrolling students</p><br> 
               </center>'
    end

    def booking_welcome
       @welcome = 
                "<center>
                <h2>This is your Bookings page!</h2>
                <p>All of your Bookings will apear here</p><br>
                <p>Here you can review your upcoming booking, scan back to old bookings or make a new booking</p><br>
                <h3>You dont't currently have any bookings!</h3>
                </center>"
    end

    def student_welcome
       @welcome = 
               "<center>
                 <h2>This is your Students page!</h2>
                 <p>All of your registered students will apear here</p><br>
                 <h3>You currently have no students!</h3>
                 <p>Invite some students to join you and enrol them onto a course</p><br> 
               </center>"
    end

    def forum_welcome
       @welcome = 
            "<center>
              <h2>This is your Forums page!</h2>
              <p>This is where all your communication happens</p><br>
              <p>Forums are created for course and one to one feedback</p><br>
              <h3>You don't currently have any Forums!</h3> 
              <p>Be patient, they will come..</p>
            </center>"
    end


    def school_welcome
       @welcome =
             "<center>
                  <h2>This is your Schools page!</h2>
                  <h4>Schools can be used as a home for your courses</h4>
                  <p>If you ar a tutor and have many courses, put them <br>in a school and adveritse it through your profile</p>
             </center>"
    end

    def products_welcome
       @welcome =
             "<center>
               <h2>This is your Products page!</h2><br>
               <p>All of your registered products will be found here</p>
               <p>Products can be added to courses to give them value and advertised in the course profile</p><br>
               <h3>You don't have any Products yet</h3>
               <p>Start creating some!</p>
             </center>"
    end

    def enrolment_message
       @enrolment_empty =
             "<center>
               <h2>You don't have any students to enroll!</h2><br>
               <p>Either you are still pending a request or you haven't registered any</p>
               <p>Start registering some!</p>
             </center>"
    end

    def price_message
       @no_prices =
             "<center>
               <h2>Add some prices to your course!</h2><br>
               <p>Let students no how much your course costs by adding some products</p>
             </center>"
    end

    def no_product_message
       @no_prices =
             "<center>
               <h2>You don't have any products to add to your course!!</h2><br>
               <p>Create some products so you can add them to your course and <br> let students no how much your course costs</p>
             </center>"
    end

    def no_video_message
       @no_videos =
             " <center><h3>Add Some Videos!</h3>
                <p>Start adding some links to your favourite youtube videos to use in your topics.</p>
                <p>You can add videos to topics on the fly when you create the content for you topic.<br> 
                All the videos you link to will be shown here.</p><br>
              </center>"
    end 

    def no_materials
       @no_materials =
             "<center>
                <h2>Welcome to your Materials Page!</h2>
                <p>Here you can organize all your course content into a useful chunks to make up your sylabus
                <br>Using the tabs at the side you can begin to build up a comprehesive arrangement of materials that will help you structure your tuition.</p><br> 

                <h3>How To Oragnize your Materials:</h3>
                <p>Its really very simple:</p>
              </center>"
    end 

    def no_uploads
       @no_uploads =
             "<center>
                  <h3>Upload some Documents!</h3>
                  <p>Start uploading some PDF or images to add to your topics.</p>
                  <br>
              </center>"
    end 


    def no_topics
       @no_topics =
             "<center><h3>Add Some Topics!</h3>
                <p>Topics are your where your main content goes. Create a new topic and add content to it.</p>
                <p>Topics can be added to any subject you have created.<br> So if topic is needed over a number of subjects you can simply add it to all of them. Smashing</p>
                <br>
              </center>"
    end 

    def no_subjects
        @no_subjects = 
            "<center><h3>Add Some Subjects!</h3>
                <p>Subjects act as the header to you topics. Create a new subject, add a description and begin adding your topics to it.</p><br>
            <center>"
    end

end