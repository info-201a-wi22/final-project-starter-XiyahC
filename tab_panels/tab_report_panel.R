
#report_panel


tab_report_panel <- tabPanel(
  "Report",
  h1("Our Report"),
  br(),
  p("Han Rui Liu, Kris Shen, Iris Mao, Xiyah Chang"),
  br(),
  p("3/8/2022"),
  br(),
  fluidRow(
    column(
      12,
      uiOutput("report")
    )
  )
)
