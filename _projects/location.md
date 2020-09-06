--- 
title: "Trained multiple adversarially robust convolutional neural networks for location estimation" 
sequence: 1
description: mAcHiNe LeArNiNg
publish: true
--- 

# Trained multiple adversarially robust convolutional neural networks for location estimation 

Answer the following questions picked by the trained classifier: 

<input type="checkbox"> Is anyone in your family in the military? 

<input type="checkbox"> Is it raining right now?

<input type="checkbox"> Have you ever seen an elephant? 

<input type="checkbox"> Have you heard of Elton John? 

<input type="checkbox"> Do you have a driver's license? 

<button type="button" onclick="getLocation()">
Submit</button>

<script>
    const getLocation = () => {
        const xhr = new XMLHttpRequest() 
        xhr.onreadystatechange = () => {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                const status = xhr.status 
                if (status === 0 || (status >= 200 && status < 400)) {
                    const res = JSON.parse(xhr.responseText)
                    window.alert(`${Math.floor(Math.random() * 10) + 90}% chance you're in ${res.city}, ${res.region}`)
                }
            }
        }
        xhr.open("GET", "https://ipapi.co/json", true) 
        xhr.send()
    }
</script>
