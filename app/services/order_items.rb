# frozen_string_literal: true

class OrderItems
  def call(arg0, *arg1, **_arg2)
    case arg0
    when 'increase'
      increase_quantity(arg1)
    when 'decrease'
      decrease_quantity(arg1)
    when 'size'
      increase_size(arg1[0])
    when 'remove'
      remove_item(arg1)
    when 'update_sub'
      update_subtotal(arg1)
    when 'cal_sub'
      cal_subtotal(arg1)
    end
  end

  private

  def cal_subtotal(subtotal)
    subtotal[0] += Product.find(subtotal[1]).price * subtotal[2]
  end

  def update_subtotal(subtotal)
    subtotal[0][subtotal[1]] = subtotal[2]
    subtotal[3] += subtotal[4] * subtotal[0][subtotal[1]]
    [subtotal[0], subtotal[3]]
  end

  def remove_item(session_delete)
    session_delete[0] -= 1
    session_delete[1] -= session_delete[2] * session_delete[3]
    [session_delete[0], session_delete[1]]
  end

  def increase_quantity(session_update)
    session_update[0] << session_update[2]
    session_update[1] << session_update[3]
    [session_update[0], session_update[1]]
  end

  def decrease_quantity(session_update)
    index = session_update[0].index(session_update[2])
    session_update[1][index] += session_update[3]
    session_update[1]
  end

  def increase_size(count)
    count + 1
  end
end
