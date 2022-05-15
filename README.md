
# Before launching

    rails db:migrate
    rails db:seed

## Controllers
 - `PaymentsController`

## Jobs
 - `PaymentCreatorJob` - used to query payment creation requests in the background
 - `PaymentStatusCheckerJob` - performs payment status checks, queries separate jobs per payment
 - `PaymentStatusUpdaterJob` - does the actual request and payment status update in the DB

## Bank API connectors
Bank connection part is supposed to be located in the `Connectors` namespace. It being abstract, we only have `Connectors::Base` supposed to represent a rough look at what it does.

### Thinks to improve (in order of importance):

 1. security - to have actual security with request signing, certificates;
 2. logging - log all incoming and outcoming requests;
 3. identify what parts we store we need to apply additional security regarding data privacy as per PSD2 and GDPR legislation;
 4. improve token flow related to authorization with bank APIs;
 5. parameter validation and better error handling for a more friendly and explicit workflow for end users;
