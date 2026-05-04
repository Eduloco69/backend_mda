CREATE OR ALTER VIEW v_lista_tickets as (
    SELECT [ticketId]
          ,[NroTicket]
          ,[tituloTicket]
          ,b.[estadoTicketId]
          ,b.[estadoTicket]
          ,c.[tipoTicketId]
          ,c.[tipoTicket]
          ,d.[idPrioridad]
          ,d.[prioridadTicket]
          ,f.[categoriaId]
          ,f.[categoria]
          ,e.subCat
          ,e.subCatId
          ,a.usuarioSolicitudTicket
          ,CASE 
            WHEN a.usuarioSolicitudTicket IS NOT NULL 
                THEN CONCAT(sol.userNom,' ',sol.userApPat,' ',sol.userApMat)
            ELSE soli.nombre
           END as usuarioSolicitante
          ,a.usuarioTicketAsignado
          ,CASE 
            WHEN a.usuarioTicketAsignado IS NOT NULL 
                THEN CONCAT(asig.userNom,' ',asig.userApPat,' ',asig.userApMat)
            ELSE 'Sin Asignar'
           END as usuarioAsignado
          ,[fechaCreacionTicket]
      FROM [MesaDeAyuda].[dbo].[ticket] a 
      LEFT JOIN [MesaDeAyuda].[dbo].[estadoTicket] b
        ON (a.estadoTicket = b.estadoTicketId)
      LEFT JOIN [MesaDeAyuda].[dbo].[tipoTicket] c
        ON (a.tipoTicket = c.tipoTicketId)
      LEFT JOIN [MesaDeAyuda].[dbo].[prioridadTicket] d
        ON (a.prioridadTicket = d.idPrioridad)
      LEFT JOIN [MesaDeAyuda].[dbo].[subCategoriaTicket] e
        ON (a.subcategoriaTicket = e.subCatId)
      LEFT JOIN [MesaDeAyuda].[dbo].[categoria] f
        ON (e.categoriaId = f.categoriaId)
      LEFT JOIN [MesaDeAyuda].[dbo].[usuario] sol
        ON (a.usuarioSolicitudTicket = sol.userId)
      LEFT JOIN [MesaDeAyuda].[dbo].[solicitante] soli
        ON (a.solicitanteTicket = soli.solicitanteId)
      LEFT JOIN [MesaDeAyuda].[dbo].[usuario] asig
        ON (a.usuarioTicketAsignado = asig.userId)
      LEFT JOIN [MesaDeAyuda].[dbo].[usuario] crea
        ON (a.usuarioTicketCreacion = crea.userId)
)