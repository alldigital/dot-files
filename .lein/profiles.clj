{:user {:dependencies [[pjstadig/humane-test-output "0.8.3"]
                       [org.clojure/clojure "1.9.0"]
                       [vvvvalvalval/scope-capture "0.1.4"]
                       [alembic "0.3.2"]
                       [spyscope "0.1.5"]
                       [jonase/eastwood "0.2.5"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (require 'sc.api)
                     (require 'spyscope.core)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[lein-ancient "0.6.15"]
                  [me.arrdem/lein-git-version "2.0.4"]
                  [lein-pprint "1.2.0"]
                  [com.jakemccrary/lein-test-refresh "0.22.0"]
                  [lein-try "0.4.3"]
                  [lein-kibit "0.1.6"]
                  [lein-deps-tree "0.1.2"]
                  [lein-cljfmt "0.5.7"]
                  [lein-exec "0.3.7"]
;                  [lein-gorilla "0.4.0"]
                  ]
        :gorilla-options
        {:keymap {"command:worksheet:newBelow" "alt+o"
                    "command:worksheet:newAbove" "alt+shift+o"}
           :load-scan-exclude #{".git" ".svn"}}}}
