provider "github" {
  # Configuration options
  token = "<your github token>"

}


resource "github_repository" "example" {
  name = "terraform-repo"

  visibility = "private"


}
