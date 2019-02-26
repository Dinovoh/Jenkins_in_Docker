import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins

def instance = Jenkins.instance

//csrf prevension
instance.setCrumbIssuer(new DefaultCrumbIssuer(true))

//disable CLI over Remoting
jenkins.model.Jenkins.instance.getDescriptor("jenkins.CLI").get().setEnabled(false)

instance.save()
