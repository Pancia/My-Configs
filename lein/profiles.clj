{:user {:plugins [[cider/cider-nrepl "0.12.0"]
                  [lein-ancient "0.6.8"]
                  [lein-bikeshed "0.2.0"]
                  [lein-kibit "0.1.2"]
                  [lein-localrepo  "0.5.3"]
                  [lein-pprint "1.1.1"]
                  [untangled/lein-template "0.4.1-SNAPSHOT"]
                  [untangled-release "0.1.1-SNAPSHOT"]]

        :repl-options {:timeout 120000}

        :repositories [["releases" {:url "https://artifacts.buehner-fry.com/artifactory/release"
                                    :update :always}]]

        :deploy-repositories [["releases" {:id            "central"
                                           :url           "https://artifacts.buehner-fry.com/artifactory/navis-maven-release"
                                           :snapshots     false
                                           :sign-releases false}]
                              ["snapshots" {:id            "snapshots"
                                            :url           "https://artifacts.buehner-fry.com/artifactory/navis-maven-snapshot"
                                            :sign-releases false}]]

        :dependencies [[cljfmt "0.3.0"]
                       [repetition-hunter "1.0.0"]]}}
