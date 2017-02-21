{:user {:dependencies [[pjstadig/humane-test-output "0.8.1"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/clojure "1.8.0"]
                       [alembic "0.3.2"]
                       [jonase/eastwood "0.2.3"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[lein-ancient "0.6.10"]
                  [lein-pprint "1.1.2"]
                  [com.jakemccrary/lein-test-refresh "0.17.0"]
                  [lein-try "0.4.3"]
                  [lein-kibit "0.1.3"]
                  [lein-deps-tree "0.1.2"]
                  [lein-cljfmt "0.5.6"]]}}
