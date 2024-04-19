provider "tfe" {
  token = "8qTxC1y4K2Qzzw.atlasv1.P8chi283ycIYiKaiWkELlXiRSebXTaiOyRfdddgYVmpXyrQAYd21P2uIxrg2AOSS3gU"
}

resource "tfe_team" "example_team" {
  name         = "example-team"
  organization = "TFE-provider-playground"
}