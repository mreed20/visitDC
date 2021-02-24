---
layout: page
title: Planner
---

<div>
    <table class="table">
        <tbody class="cart">
        </tbody>
    </table>
</div>

<script>
  function renderCart(items) {
    const $cart = document.querySelector(".cart")

    $cart.innerHTML = items.map((item) => `
        <tr>
          <td>
            ${item.name}
          </td>
          <td class="text-right">
            <Button class="btn btn-primary" onClick="cartLS.remove(${item.id})">Delete</Button>
          </td>
        </tr>`).join("")
  }
  renderCart(cartLS.list())
  cartLS.onChange(renderCart)
</script>