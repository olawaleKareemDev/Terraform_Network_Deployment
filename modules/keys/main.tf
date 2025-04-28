resource "aws_key_pair" "deployer" {
  key_name    = "retrunBuildKey"
  public_key = file("~/.ssh/id_ed25519.pub_olawalekareemdev") 
}