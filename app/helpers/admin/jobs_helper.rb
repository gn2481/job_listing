module Admin::JobsHelper
  def render_job_status(job)
    if job.is_hidden
      content_tag(:i, '', class: 'fas fa-lock')
    else
      content_tag(:i, '', class: 'fas fa-globe-asia')
    end
  end
end
