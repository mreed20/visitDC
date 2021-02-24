---
layout: page
title: Planner
---


<style>

.cart {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
}

.drag_target {
    height: 100px;
    width: 100px;
    border: solid 3px #ccc;
    margin: 10px;
}

.item {
    cursor: move;
    border: solid 3px #ccc;
    margin: 10px;
}
</style>


<h3> Staging area </h3>
<div class="cart w3-container" style="margin: 10px; border: solid 3px #ccc;">
</div>

<h3> Destination area </h3>
<div class="w3-container"
     style="display: flex; flex-direction: row; margin: 10px; border: solid 3px #ccc;"
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

      <div class="item" id=${item.id} draggable="true" ondragstart="drag(event)">
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

  function handleDragStart(e) {
    this.style.opacity = '0.4';
  }

  function handleDragEnd(e) {
    this.style.opacity = '1';
  }

  function handleDragOver(e) {
    if (e.preventDefault) {
      e.preventDefault();
    }
    return false;
  }

  let items = document.querySelectorAll('.item');
  items.forEach(function(item) {
    item.addEventListener('dragstart', handleDragStart, false);
    item.addEventListener('dragend', handleDragEnd, false);
    item.addEventListener('dragover', handleDragOver, false);
  });
</script>