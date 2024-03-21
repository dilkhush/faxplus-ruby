# FaxPlus

Faxplus is a Ruby library for interacting with faxplus APIs.

## Setting things up.
To start using faxplus, you first need to add it to your Gemfile, with an entry such as this:

```ruby
gem 'faxplus_ruby'
```

Afterwards, run `bundle install` 

Next, you'll need to create a PAT token from faxplus dashboard here is the link [https://apidoc.fax.plus/v3/?shell#option-1-personal-access-tokens-pats

## Accounts.

```ruby
client = FaxplusApi::Client.new(access_token: ENV['FAXPLUS_PAT_TOKEN'])
client.account.accounts # List corporate members
client.account.user(user_id: 'userid') # Get account information
client.account.update_user(user_id: 'userid') # Modify account information
client.account.member(member_user_id: 'member_user_id') # Get member details
client.account.update_member(member_user_id: 'member_user_id') # Modify member details
```

## Numbers.

```ruby
client.number.list(user_id: 'userid') # List phone numbers
client.number.get(user_id: 'userid', number: 'number') # Get number information
client.number.update(user_id: 'userid', number: 'number') # Assign number
client.number.revoke(user_id: 'userid', number: 'number') # Revoke number
```
## Faxes.

```ruby
client.fax.list(user_id: 'userid') # List fax records
client.fax.get(user_id: 'userid', fax_id: 'fax_id') # Get a fax record
client.fax.update(user_id: 'userid', fax_id: 'fax_id') # Modify fax record
client.fax.revoke(user_id: 'userid', fax_id: 'fax_id') # Delete a fax
```
## Files.

```ruby
# Upload a file
client.file.upload(user_id: 'userid', data: {fax_file: File.open('pdf_file_path.pdf'), multipart: true}) => {:path => "/storage/transient-hsfhadhaskha.pdf"}
client.file.get(user_id: 'userid', fax_id: 'fax_id') # Download fax file
client.file.fax_report(user_id: 'userid', fax_id: 'fax_id') # Get fax confirmation report
```
## Outbox.

```ruby
client.outbox.list(user_id: 'userid') # List faxes in the outbox
# file_path from the client.file.upload output path
client.outbox.send(user_id: 'userid', data: {from: "+12345667", to: ["+12345688"], files: [file_path]}) # Send a fax 
client.outbox.get(user_id: 'userid', outbox_fax_id: 'outbox_fax_id') # List outgoing faxes
client.outbox.update(user_id: 'userid', outbox_fax_id: 'outbox_fax_id') # Delete an outgoing fax
client.outbox.delete(user_id: 'userid', outbox_fax_id: 'outbox_fax_id') # Modify an outgoing fax
```
## Webhooks.

```ruby
client.webhook.list # List user webhooks
client.webhook.create # Register new webhook
client.webhook.delete(hook_id: 'hook_id') # Delete webhook
```

## Testing
TODO

## More help
Please submit an issue via GitHub if you need more help with the faxplus_ruby gem.
