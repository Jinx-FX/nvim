return {
	"mg979/vim-visual-multi",
	init = function()
		vim.cmd([[
			let g:VM_leader                     = {'default': '\', 'visual': '\', 'buffer': '\'}
			let g:VM_maps                       = {}
			let g:VM_maps["Add Cursor Down"]    = '∆'  "/ M-j
			let g:VM_maps["Add Cursor Up"]      = '˚'  "/ M-k
			let g:VM_maps['Find Under']         = '<C-l>'
			let g:VM_maps['Find Subword Under'] = '<C-L>'
			let g:VM_maps['Find Next']          = ''
			let g:VM_maps['Find Prev']          = ''
			let g:VM_maps['Remove Region']      = 'q'
			let g:VM_maps['Skip Region']        = '<c-m>'
			let g:VM_maps["Undo"]               = 'u'
			let g:VM_maps["Redo"]               = '<C-r>'
			noremap <leader>sa <Plug>(VM-Select-All)
]])
	end
}
