neoscroll = require('neoscroll')
neoscroll.setup({
  -- Default easing function used in any animation where
  -- the `easing` argument has not been explicitly supplied
  easing = "quadratic"
})
local duration_time = 60
local keymap = {
  -- Use the "sine" easing function
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = duration_time; easing = 'quadratic' }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = duration_time; easing = 'quadratic' }) end;
  -- Use the "circular" easing function
  ["<C-b>"] = function() neoscroll.ctrl_b({ duration = duration_time; easing = 'quadratic' }) end;
  ["<C-f>"] = function() neoscroll.ctrl_f({ duration = duration_time; easing = 'quadratic' }) end;
  ["zz"] = function() neoscroll.zz({ half_win_duration = duration_time; easing = 'quadratic' }) end;
  -- When no value is passed the `easing` option supplied in `setup()` is used
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = duration_time }) end;
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = duration_time }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
