return {
	"hellopradeep69/Train",
	lazy = false, -- load immediately
	config = function()
		require("train").setup({ window_name = "Code" })
	end,
}
