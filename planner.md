---
layout: page
title: Planner
---


<h3> Staging area </h3>
<div class="cart w3-container"
     style="display: flex; flex-direction: row; align-items: center; margin: 10px; border: solid 3px #ccc;"
     ondrop="drop(event)"
     ondragover="allowDrop(event)">
</div>

<h3> Destination area </h3>
<div class="w3-container"
     style="display: flex; flex-direction: row; margin: 10px;"
     ondrop="drop(event)"
     ondragover="allowDrop(event)">

  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Monday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Tuesday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Wednesday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Thursday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Friday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Saturday</div>
  <div class="drag_target" ondrop="drop(event)" ondragover="allowDrop(event)">Sunday</div>
</div>

<script>
  // Renders the cart div.
  function renderCart(items) {
    const $cart = document.querySelector(".cart")

    if (cartLS.list().length == 0) {
      $cart.innerHTML = `<b>Planner is empty!</b>`
    } else {
      $cart.innerHTML = items.map((item) => `

      <div class="draggable_item" id=${item.id} draggable="true" ondragstart="drag(event)">
        ${item.name}
        <button class="btn btn-primary" onClick="cartLS.remove(${item.id})">Delete</Button>
      </div>`).join("")
    }
  }
  renderCart(cartLS.list())
  cartLS.onChange(renderCart)

  //
  // Drag'n'drop logic
  //

  function allowDrop(ev) {
    ev.preventDefault();
  }

  function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
  }

  function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
  }
</script>