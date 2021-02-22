---
layout: page
title: Categories
---

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.grid-container {
  display: grid;
  grid-template-columns: auto auto;
  background-color: #FFFFFF;
}
.grid-item {
  background-color: #FFFFFF;
  border: 1px solid rgba(255, 255, 255, 0.8);
  padding: 10px;
  font-size: 35px;
  text-align: center;
}
</style>


<div class="grid-container">

    {% for activity in site.data.activities %}

    <div class="grid-item">
        <div class="w3-display-container">
            <img src="{{ activity[1].path_photo }}">
            <div class="w3-display-middle">
                <a class="w3-text-white" style="text-shadow:2px 2px 0 #444" href="{{ activity[1].path_page }}">
                    {{ activity[0] }}
                </a>
            </div>
        </div>
    </div>  

    {% endfor %}

</div>

Done? [Click here to finalize your plan](planner.md).