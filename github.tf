provider "github" {
  # Configuration options
  token = "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"

}


resource "github_repository" "example" {
  name = "terraform-repo"

  visibility = "private"


}
