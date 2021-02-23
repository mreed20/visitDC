---
layout: page
title: Categories
---

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-row-padding">

    {% for activity in site.data.activities %}

    <div class="w3-col s6">

        <!-- Clickable category image. -->
        <!-- Inspired by: https://www.w3schools.com/w3css/w3css_buttons.asp -->
        <div class="w3-button w3-white w3-ripple">
            <a href="{{ activity[1].path_page }}">
                <img src="{{ activity[1].path_photo }}"
                     alt="{{ activity[1].alt_photo }}">
            </a>
            <h3> {{ activity[0] }} </h3>
        </div>

    </div>  

    {% endfor %}

</div>

<br>

<p>
    <a class="w3-button w3-block w3-white w3-border w3-large" href="planner.html">
        <b>Done planning?</b> Click here to finalize your visit
    </a>
</p>