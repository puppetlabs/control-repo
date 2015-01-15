1.  Clone this repo down to your master (in /tmp is fine) and upload it to your own internal git server
2.  Edit configure_r10k.pp so that the server parameter is set to your interal git server and repo name  
3.  On your Master, run `puppet module install zack/r10k`
4.  On your Master, run `puppet apply configure_r10k.pp`
  - This will install r10k and point it at the repo we setup in step 1
5.  You're now ready to run `r10k deploy environment --verbose` which will deploy modules from your Puppetfile

Side note: You can remove configure_r10k.pp from the repo now. 

