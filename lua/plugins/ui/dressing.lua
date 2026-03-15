return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = function()
		require("dressing").setup({
			default_prompt = "Enter",
			input = {
				enabled = true,
				prefer_width = 60,

				win_options = {
					winhighlight = "", -- should be kept empty to ensure that the winhighlight property is inherited by custom theme.
				},
			},
		})
	end,
}
