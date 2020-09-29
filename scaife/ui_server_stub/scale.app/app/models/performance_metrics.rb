# <legal>
# SCALe version r.6.2.2.2.A
# 
# Copyright 2020 Carnegie Mellon University.
# 
# NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING
# INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON
# UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF
# FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS
# OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT
# MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT,
# TRADEMARK, OR COPYRIGHT INFRINGEMENT.
# 
# Released under a MIT (SEI)-style license, please see COPYRIGHT file or
# contact permission@sei.cmu.edu for full terms.
# 
# [DISTRIBUTION STATEMENT A] This material has been approved for public
# release and unlimited distribution.  Please see Copyright notice for
# non-US Government use and distribution.
# 
# DM19-1274
# </legal>

class PerformanceMetrics < ApplicationRecord
  include ActiveModel::Validations

=begin
  creates a row in the table

  rescue Exception => e

=end
  def self.addRecord(scaife_mode, function_name, metric_description, user_id, user_organization_id, project_id, start_timestamps, end_timestamps)

    timestamp = start_timestamps["transaction_timestamp"]
    elapsed_time = (end_timestamps["elapsed_time"] - start_timestamps["elapsed_time"]) / 2.0
    cpu_time = (end_timestamps["cpu_time"] - start_timestamps["cpu_time"]) / 2.0

    pm = PerformanceMetrics.create(
        scaife_mode: scaife_mode,
        function_name: function_name,
        metric_description: metric_description,
        transaction_timestamp: timestamp,
        user_id: user_id,
        user_organization_id: user_organization_id,
        project_id: project_id,
        elapsed_time: elapsed_time,
        cpu_time: cpu_time
    )

    if pm.valid?
      return true
    else
      return false
    end

end
end
