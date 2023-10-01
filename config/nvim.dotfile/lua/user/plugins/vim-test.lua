return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>ts', ':TestSuite<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  config = function()
    vim.cmd([[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! DockerTransform(cmd) abort
        return 'docker-compose --project-directory=/home/fvestermark.linux/docker-app -f /home/fvestermark.linux/docker-app/docker-compose.yml exec --user apache --workdir=/var/www/leasingmarkt.de/www/leasingmarkt/v3 -e DE phpfpm '.a:cmd
      endfunction

      let g:test#custom_transformations = {'docker': function('DockerTransform')}
      let g:test#transformation = 'docker'


      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end
}
