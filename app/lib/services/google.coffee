mediator = require 'mediator'
utils = require 'lib/utils'
ServiceProvider = require 'lib/services/service_provider'

module.exports = class Google extends ServiceProvider
  # Client-Side OAuth 2.0 login with Google
  # https://code.google.com/p/google-api-javascript-client/
  # https://code.google.com/p/google-api-javascript-client/wiki/Authentication

  # Note: This is the ID for an example Google API project.
  # You might change this to your own project ID.
  # See https://code.google.com/apis/console/
  clientId = '382467810781.apps.googleusercontent.com'

  # The permissions we’re asking for. This is a space-separated list of URLs.
  # See https://developers.google.com/accounts/docs/OAuth2Login#scopeparameter
  # and the individual Google API documentations
  scopes = 'https://www.googleapis.com/auth/userinfo.profile'

  name: 'google'

  load: ->
    return if @state() is 'resolved' or @loading
    @loading = true

    # Register load handler
    window.googleClientLoaded = @loadHandler

    # No success callback, there's googleClientLoaded
    utils.loadLib 'https://apis.google.com/js/client.js?onload=googleClientLoaded', null, @reject

  loadHandler: =>
    # Remove the global load handler
    try
      # IE 8 throws an exception
      delete window.googleClientLoaded
    catch error
      window.googleClientLoaded = undefined

    # Initialize
    gapi.auth.init @resolve

  isLoaded: ->
    Boolean window.gapi and gapi.auth and gapi.auth.authorize

  triggerLogin: (loginContext) ->
    console.log "triggerLogin: #{clientId}, #{scopes}"
    gapi.auth.authorize
      client_id: clientId, scope: scopes, immediate: false
      _(@loginHandler).bind(this, loginContext)

  loginHandler: (loginContext, authResponse) ->
    console.log authResponse
    if authResponse
      # Publish successful login
      mediator.publish 'loginSuccessful', {provider: this, loginContext}

      # Publish the session with extra userinfo
      @getUserInfo (userInfo) ->
        data =
          provider: this
          accessToken: authResponse.access_token
        _.extend(data, userInfo)
        console.log 'serviceProviderSession:', data
        mediator.publish 'serviceProviderSession', data
    else
      mediator.publish 'loginFail', {provider: this, loginContext}

  getLoginStatus: (callback) ->
    gapi.auth.authorize { client_id: clientId, scope: scopes, immediate: true }, callback

  # TODO
  getUserInfo: (callback) ->
    request = gapi.client.request path: '/oauth2/v2/userinfo'
    request.execute callback

  parsePlusOneButton: (el) ->
    if window.gapi and gapi.plusone and gapi.plusone.go
      gapi.plusone.go el
    else
      window.___gcfg = parsetags: 'explicit'
      utils.loadLib 'https://apis.google.com/js/plusone.js', ->
        try
          # IE 8 throws an exception
          delete window.___gcfg
        catch error
          window.___gcfg = undefined

        gapi.plusone.go el