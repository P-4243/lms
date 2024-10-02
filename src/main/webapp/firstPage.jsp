<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <style>
 
    body {
    
      background-repeat: no-repeat;
      background-position: center; 
      background-size:cover
      font-family: Arial, sans-serif;
      margin: 0;
      background-position: center top; /* Adjust the position to center horizontally and a little lower vertically */
  padding-top: 20px; 
      position: relative; 
    }
    
    
/* Toggle switch styles */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 34px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 50%;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
#darkModeToggle {
    position: fixed;
    top: 20px; /* Adjust top position */
    right: 20px; /* Adjust right position */
    z-index: 1000; /* Adjust z-index as needed */
}

/* Dark mode text */
.mode-text {
  margin-left: 10px;
}
/* Dark mode styles */
.dark-mode {
  background-color: #333;
  color: #fff;
}

    /* Hide the images by default */
    .mySlides {
        display: none;
        position: absolute;
        width: 100%;
        transition: opacity 1s ease;
    }
    
    
.nextSlide {
        opacity: 0.3; /* Adjust the opacity as needed */
    }
    /* Next & previous buttons */
    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        padding: 16px;
        margin-top: -22px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    .prev:hover, .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }
    .container {
      max-width: 100%;
      margin: 20px auto;
      padding: 10px;
       background-color: rgba(073, 200, 930, 0.5); 
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       position: relative; 
    }
     h2 {
      text-align: center;
    }
    .login-option {
      display: flex;
      justify-content: space-around;
      margin-top: 30px;
    }
    .login-option a {
      display: inline-block;
      padding: 20px 40px;
      text-decoration: none;
      background-color: #007bff;
      color: #fff;
      border-radius: 2px;
      transition: background-color 0.3s ease;
    }
    .login-option a:hover {
      background-color: #0056b3;
    }
     .slideshow-container {
        max-width: 50%;
        position: relative;
        margin: 0 auto;
        right: 90px; 
    }
    .orange-rectangle {
      position: absolute;
      top: 0;
      left: 30px;
      width: 150px;
      height: 650px;
      background-color: rgba(255, 165, 0, 0.4); /* Orange color with transparency */
    }
  
    
   
  </style>
</head>
<body>
<div class="container">
    <h2><b>Welcome to the Library Management System</b></h2>
    <div id="darkModeToggle">
    <label class="switch">
        <input type="checkbox" id="darkModeCheckbox">
        <span class="slider round"></span>
    </label>
    <span class="mode-text">Dark Mode</span>
</div>
    
    <div class="login-option">
      <a href="SLogin.jsp">Login as Student</a>
      <a href="ALogin.jsp">Login as Admin</a>
    </div>
  </div>
   <div class="orange-rectangle"></div>
   <div class="slideshow-container">
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/cyberlibrary.png" style="width:100%">
    </div>

    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/img_20220805_174051%202.jpg" style="width:100%">
    </div>
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/dac.png" style="width:100%">
    </div>
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/9.jpg" style="width:100%">
    </div>
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/1024%20x%20500%20dlc.png" style="width:100%">
    </div>
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/laptop%20zones.png" style="width:100%">
    </div>
    <div class="mySlides fade">
        <img src="https://library.nitk.ac.in/joomla/images/joomlashine/sample/testimonial/1024%20x%20500%20dlc.png" style="width:100%">
    </div>
    
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>
   </div>
   
   
   
<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlides, 4000); // Change slide every 2 seconds (2000 milliseconds)
    }

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }
 // Dark mode toggle functionality
    document.getElementById("darkModeCheckbox").addEventListener("change", function() {
      var darkModeToggle = document.body;
      if (this.checked) {
        darkModeToggle.classList.add("dark-mode");
      } else {
        darkModeToggle.classList.remove("dark-mode");
      }
    });

</script>
<h1 style="font-size: 32px; text-transform: uppercase; font-weight: bold; text-align: right; margin-right: 15px;">Announcements:</h1>
<marquee scrollamount ="2" direction="up" height="300px" width="25%" hspace="930px" vspace="20px" behavior="scroll">
<ul>
<li> Recent advancements in artificial intelligence have revolutionized the healthcare industry, with AI-powered diagnostic tools offering faster and more accurate patient assessments.</li>
<li> A groundbreaking study published in the Journal of Neuroscience unveils new insights into the neural mechanisms underlying memory formation, shedding light on potential therapeutic targets for Alzheimer's disease.</li>
<li> The emergence of blockchain technology has disrupted traditional financial systems, enabling secure and transparent peer-to-peer transactions without the need for intermediaries.</li>
<li> Researchers at MIT have developed a novel nanotechnology-based drug delivery system capable of precisely targeting cancer cells while minimizing side effects, offering new hope in the fight against cancer</li>
<li> The Internet of Things (IoT) is transforming the manufacturing industry, with connected sensors and smart devices optimizing production processes and improving efficiency.</li>
<li> A study published in Nature Communications reveals the potential of gene editing technologies like CRISPR-Cas9 in addressing genetic disorders, paving the way for personalized medicine</li>
<li> The Internet of Things (IoT) is transforming the manufacturing industry, with connected sensors and smart devices optimizing production processes and improving efficiency.</li>
<li> The emergence of blockchain technology has disrupted traditional financial systems, enabling secure and transparent peer-to-peer transactions without the need for intermediaries.</li>
</ul>
</marquee>
</body>
</html>