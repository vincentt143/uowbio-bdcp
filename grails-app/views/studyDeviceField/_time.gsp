<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="time">${deviceFieldInstance.fieldLabel}</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: studyDeviceFieldInstance, field: 'time', 'errors')}">
                                    <g:datePicker name="time" precision="day" value="${studyDeviceFieldInstance?.time}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>