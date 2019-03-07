# @summary This role installs an apache webserver and sample content on port 80.
class role::linux_webserver {
  include profile::linux_baseline
  include profile::apache
  include profile::sample_website
}
