<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="time">${deviceFieldInstance.fieldLabel}</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studyDeviceFields[i], field: 'time', 'errors')}">
                                    <joda:timePicker name="studyDeviceFields[${i}].time" precision="minute" value="${studyDeviceFields[i]?.time}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>