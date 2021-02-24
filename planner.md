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
    margin: 20px 0;
}

.box {
    height: 100px;
    width: 100px;
    border: solid 3px #ccc;
    margin: 10px;
}

.drag-over {
    border: dashed 3px red;
}

.item {
    height: 100px;
    width: 100px;
    cursor: move;
    border: solid 3px #ccc;
}
</style>


<h3> Staging area </h3>
<div class="cart w3-container" style="margin: 10px; border: solid 3px #ccc;">
</div>

<h3> Destination area </h3>
<div class="w3-container" style="display: flex; flex-direction: row; margin: 10px; border: solid 3px #ccc;">
  <div class="box">Monday</div>
  <div class="box">Tuesday</div>
  <div class="box">Wednesday</div>
  <div class="box">Thursday</div>
  <div class="box">Friday</div>
  <div class="box">Saturday</div>
  <div class="box">Sunday</div>
</div>

<script>
  function renderCart(items) {
    const $cart = document.querySelector(".cart")

    if (cartLS.list().length == 0) {
      $cart.innerHTML = `<b>Planner is empty!</b>`
    } else {
      $cart.innerHTML = items.map((item) => `

      <div class="item" draggable="true">
        ${item.name}
        <button class="btn btn-primary" onClick="cartLS.remove(${item.id})">Delete</Button>
      </div>`).join("")
    }
  }
  renderCart(cartLS.list())
  cartLS.onChange(renderCart)
</script>