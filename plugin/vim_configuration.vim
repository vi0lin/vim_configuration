let runtimepath=split(&runtimepath, ",")[0]
let p = 'autoload/vim_configuration'
let p = 'src'
exec 'source '..runtimepath..'/plugged/vim_configuration/'..p..'/Functions.vim9'
exec 'source '..runtimepath..'/plugged/vim_configuration/'..p..'/Functions.vim'
