App.LeadRoute = Ember.Route.extend
  model: (params) -> @store.find 'lead', params.id

  contextDidChange: ->
    if lead = @controllerFor('lead').get('model')
      if lead.get('isDirty') and confirm 'Do you want to save your changes?'
        lead.save()
      else
        lead.rollback()