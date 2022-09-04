local M = {}

local split = "vsplit"

M.setup = function(opts)
	if opts.split_direction == "horizontal" then
		split = "split"
	end
end

local sterm_buf = -1

M.toggle = function()
	local sterm_exists = false
	local buf_valid = vim.api.nvim_buf_is_loaded(sterm_buf)
	if buf_valid then
		local buf_type = vim.api.nvim_buf_get_option(sterm_buf, "buftype")
		sterm_exists = buf_type == "terminal"
	end

	if not sterm_exists then -- no sterm buffer exists -> create it and show it
		vim.cmd(split)
		local win = vim.api.nvim_get_current_win()
		local buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_win_set_buf(win, buf)
		vim.cmd("term")
		sterm_buf = buf
	else -- sterm buffer exists
		local win_id = vim.fn.bufwinid(vim.fn.bufname(sterm_buf))
		if win_id == -1 then -- sterm buffer is not visible -> open new win for it
			vim.cmd(split)
			local win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_buf(win, sterm_buf)
		else -- sterm buffer is visible -> hide it
			vim.api.nvim_win_hide(win_id)
		end
	end
end

return M
